class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260418-163314"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c24ac8a852272d72b62b61f53c1e2b38b3b0c960ba93473224f9658f94012d48"
    sha256 cellar: :any_skip_relocation, sequoia:      "d9fce21eae24da1d31240e087ca1b90e9143c86cf1b932268a2eecd9b26be2b7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "943e823aa3b8e2c70aacb4387635755790f6510747b9f8a1879d0e08606ac46c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "88d1cb7a62a48722b442baa79a76b70f70d685c498d4a3662c86a0a8bef877d7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "71bb3fb0658ad73cbfb3a4e2efbd20ea9bae9590435f15525cde48e3a0356096" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "34bc03295977558b0c5c1eec26e61c39f9b4c667fc4bf459f9c98df7d4c07224" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.39+d092c752f.tar.xz"
  version "0.17.0-dev.39+d092c752f"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
