class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "acd16f7248dff3b52ca0bb2601f2ec3ee7a115321c0a2c70b0d7231d8637f908" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "215da44f5608bc39f19b890f76f2402eb1f4462b9d7b73e4e02f5fb8e25cd660" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cd73a3f3dc5e121712c9f8de7988e725b988516f3b50cfd3354033cec87b4c70" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2834+13101295b.tar.xz"
  version "0.11.0-dev.2834+13101295b"
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
