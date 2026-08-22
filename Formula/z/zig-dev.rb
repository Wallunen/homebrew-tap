class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260820-005437"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "68c267ae5a4fdf7e16043393f5bfba3bfcf822f61bc105bada11b4c1da662152"
    sha256 cellar: :any_skip_relocation, sequoia:      "d3a28df5b0157740e6684394dfd8a9159dd25d28105ac7b3304d921d2b0a6a81"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a713c21eb3a22d5f40e28d1653ec5596e8815ad4a6b91d5b197afb9d117b037d"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "46db34a5b1101a58a42d5852e6746cb199b6ea64db388f5488a814d1210cb323" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6b0538fd45e58adae3ef02e500d8c58774ed28578658c1234e89f468a1a4ec76" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b2c228dea21ecc4d0b56f78685b7f296fd095e56b630dec3960a476c0512b631" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1824+7988f7952.tar.xz"
  version "0.17.0-dev.1824+7988f7952"
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
